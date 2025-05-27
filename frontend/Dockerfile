# docker for backend
FROM node:latest
RUN apt update && apt install -y git
WORKDIR /app

ARG O_REPO_F=f0
RUN \
  if [ "$O_REPO_F" = "f0" ]; then \
    REPO=$(git ls-remote https://github.com/projektpaw/projektpaw | grep -o 'refs/heads/f[0-9]*' | grep -o 'f[0-9]*' | sort -r | head -1); \
  else \
    REPO="$O_REPO_F"; \
  fi && \
  git clone -b "$REPO" --single-branch https://github.com/projektpaw/projektpaw repo && \
  echo "$REPO" > repo.txt

WORKDIR /app/repo
COPY .env ./
RUN npm install
EXPOSE 3000
CMD ["npm", "start"]