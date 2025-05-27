
#docker for backend
FROM node:slim
RUN apt update && apt install -y git
WORKDIR /app
ARG O_REPO_B=b0
RUN \
  if [ "$O_REPO_B" = "b0" ]; then \
    REPO=$(git ls-remote https://github.com/projektpaw/projektpaw | grep -o 'refs/heads/b[0-9]*' | grep -o 'b[0-9]*' | sort -r | head -1); \
  else \
    REPO="$O_REPO_B"; \
  fi && \
  git clone -b "$REPO" --single-branch https://github.com/projektpaw/projektpaw repo && \
  echo "$REPO" > repo.txt
WORKDIR repo
COPY .env ./
RUN npm install
EXPOSE 5000
CMD ["node","server.js"]