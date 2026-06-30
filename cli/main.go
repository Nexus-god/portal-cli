package main

import (
	"fmt"
	"os"
)

const version = "1.0.0"

func main() {
	if len(os.Args) > 1 && os.Args[1] == "version" {
		fmt.Printf("portalcli v%s\n", version)
		return
	}

	fmt.Println("🚀 Portal CLI v" + version)
	fmt.Println("Usage: portalcli [command]")
	fmt.Println("\nCommands:")
	fmt.Println("  version  - Show version")
	fmt.Println("  help     - Show this help")
}
