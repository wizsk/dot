// sklayout.go aka Switch Keybard layout
// go build -ldflags "-s -w" sklayout.go

// add thelse
// exec = pkill -SIGUSR2 sklayout
// bind = $mainMod, SPACE, exec, pkill -SIGUSR1 sklayout || hyprctl switchxkblayout at-translated-set-2-keyboard next
// bind = $mainMod SHIFT, SPACE, exec, hyprctl switchxkblayout at-translated-set-2-keyboard next; pkill -SIGUSR2 sklayout

package main

import (
	"bytes"
	"encoding/json"
	"flag"
	"os"
	"os/exec"
	"os/signal"
	"strconv"
	"strings"
	"syscall"
	"time"
)

var (
	defaultSwitchDelay int64 = 1000 * 1 // miliseconds
	switchDelay        int64
)

func main() {
	parseFlags()
	s := genState()

	switchSig := make(chan os.Signal, 3)
	signal.Notify(switchSig, syscall.SIGUSR1)

	// on relaod
	realodSig := make(chan os.Signal, 1)
	signal.Notify(realodSig, syscall.SIGUSR2)

	lock := make(chan os.Signal, 1)
	signal.Notify(lock, syscall.SIGWINCH)

	for {
		select {
		case <-realodSig:
			s = genState()

		case <-switchSig:
			s.switchl()

		case <-lock:
			s.switchl()
		}

	}
}

func parseFlags() {
	flag.Int64Var(&switchDelay, "d", defaultSwitchDelay,
		"delay before doing swapping in MS")
	flag.Parse()
}

type state struct {
	// last changed
	then    int64
	layouts []string
	stack   []int
	active  int
	// prs             bool
	shouldNotSwitch bool
	// us           int
}

func genState() state {
	s := state{}
	s.then = time.Now().UnixMilli()
	s.layouts = getLayouts()
	s.shouldNotSwitch = len(s.layouts) == 1

	// s.us = slices.Index(s.layouts, "us")
	s.stack = make([]int, len(s.layouts))
	for i := 1; i < len(s.layouts); i++ {
		s.stack[i] = i
	}

	if setLayout(0) == nil {
		notify(s.layouts[0])
	}
	return s
}

func (s *state) switchl() {
	if s.shouldNotSwitch {
		return
	}

	now := time.Now().UnixMilli()
	d := now - s.then
	var n int

	if d <= switchDelay {
		e := len(s.stack) - 1 // end
		n = s.stack[e]
		s.stack[0] = n
		s.stack[e] = s.active

		// s.prs = true
	} else {
		// s.prs = false
		n = s.stack[1]
		s.stack[0] = n
		s.stack[1] = s.active
	}

	s.active = n
	s.then = now

	if setLayout(n) != nil {
		return
	}

	notify(strings.ToUpper(s.layouts[n]))
}

func setLayout(n int) error {
	c := exec.Command("hyprctl", "switchxkblayout", "at-translated-set-2-keyboard", strconv.Itoa(n))
	c.Stdin = os.Stdin
	c.Stderr = os.Stderr
	return c.Run()
}

func notify(layOut string) {
	exec.Command("dunstify", "-a", "switch-keyboard-layout", "-u", "low", "-r", "9993",
		"-h", "string:value:"+layOut, "Layout: "+layOut, "-t", "2000").Start()
}

type Dev struct {
	Keyboards []_Keyboard `json:"keyboards"`
}

type _Keyboard struct {
	// ActiveKeymap string `json:"active_keymap"`
	Main   bool   `json:"main"`
	Layout string `json:"layout"`
}

func getLayouts() []string {
	buf := new(bytes.Buffer)
	c := exec.Command("hyprctl", "devices", "-j")
	c.Stdout = buf

	if err := c.Run(); err != nil {
		// fmt.Fprintf(os.Stderr, "while running: %s\n", err)
		os.Exit(1)
	}

	dv := Dev{}
	if err := json.Unmarshal(buf.Bytes(), &dv); err != nil {
		// fmt.Fprintf(os.Stderr, "while parsing json: %s\n", err)
		os.Exit(1)
	}

	for _, k := range dv.Keyboards {
		if k.Main {
			return strings.Split(k.Layout, ",")
		}
	}
	return nil
}
