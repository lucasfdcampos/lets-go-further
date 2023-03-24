# Imagem base
FROM golang:latest

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos go.mod e go.sum para o diretório de trabalho
COPY go.mod go.sum ./

# Baixa as dependências
RUN go mod download

# Copia todo o resto do código para o diretório de trabalho
COPY . .

# Compila o projeto
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o bin/greenlight ./cmd/api

# Define a porta em que a aplicação escutará
EXPOSE 4000

# Comando para iniciar a aplicação
CMD ["./bin/greenlight"]
