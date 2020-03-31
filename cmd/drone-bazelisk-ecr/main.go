package main

import (
	"log"
)

func main() {
	// get new plugin object
	p, err := newPlugin()
	errFatal(err)

	// run bazelisk
	err = p.exec()
	errFatal(err)
}

func errFatal(err error) {
	if err != nil {
		log.Fatal(err)
	}
}
