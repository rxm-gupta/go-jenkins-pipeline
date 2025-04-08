# Start from the official Go base image
FROM golang:1.22.2

# Set working directory inside the container
WORKDIR /app

# Copy go.mod
COPY go.mod ./
RUN go mod download

# Copy the source code
COPY . .

# Build the Go app
RUN go build -o main .

# Expose the app on port 8080
EXPOSE 8080

# Run the compiled binary
CMD ["./main"]

