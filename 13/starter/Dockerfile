FROM golang:1.21 AS pluto

WORKDIR /app

COPY main.go .
RUN go mod init example.com/hello
RUN go get github.com/joho/godotenv
RUN go get github.com/go-sql-driver/mysql
RUN CGO_ENABLED=0 GOOS=linux go build -o main 

FROM alpine:3.21
WORKDIR /app
COPY . .
COPY --from=pluto /app/main /app

CMD ["/app/main"]

