package main

import (
	"database/sql"
	"fmt"
	"log"
	"os"

	"github.com/joho/godotenv"
	_ "github.com/go-sql-driver/mysql"
)

func main() {
	// Load environment variables from .env file
	err := godotenv.Load()
	if err != nil {
		log.Fatalf("❌ Error loading .env file: %v", err)
	}

	// Read DSN from environment variable
	dsn := os.Getenv("DSN")
	if dsn == "" {
		log.Fatal("❌ DSN environment variable is not set")
	}

	// Open the connection
	db, err := sql.Open("mysql", dsn)
	if err != nil {
		log.Fatalf("❌ Error opening database: %v", err)
	}
	defer db.Close()

	// Verify the connection
	err = db.Ping()
	if err != nil {
		log.Fatalf("❌ Error connecting to the database: %v", err)
	}

	fmt.Println("✅ Successfully connected to MySQL!")
}
