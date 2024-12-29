package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"os"
	"os/exec"
	"strings"
)

type Data struct {
	Keyboards []Keyboard `json:"keyboards"`
}

type Keyboard struct {
	ActiveKeymap string `json:"active_keymap"`
	Main         bool   `json:"main"`
}

func main() {
	cmd := []string{"hyprctl", "devices", "-j"}
	buf := new(bytes.Buffer)
	c := exec.Command(cmd[0], cmd[1:]...)
	c.Stdout = buf
	if err := c.Run(); err != nil {
		fmt.Fprintf(os.Stderr, "while running: %s\n", err)
		os.Exit(1)
	}

	d := Data{}
	if err := json.Unmarshal(buf.Bytes(), &d); err != nil {
		fmt.Fprintf(os.Stderr, "while parsing json: %s\n", err)
		os.Exit(1)
	}

	for _, k := range d.Keyboards {
		if k.Main && len(k.ActiveKeymap) >= 2 {
			fmt.Println(strings.ToLower(k.ActiveKeymap[:2]))
			return
		}
	}

	fmt.Fprintf(os.Stderr, "err: could not find any layout\n")
	os.Exit(1)
}
