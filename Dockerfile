FROM ruby:3.2

# Instalar dependências
RUN apt-get update -qq && apt-get install -y nodejs npm postgresql-client

# Instalar Tailwind CSS CLI
RUN npm install -g tailwindcss

# Criar diretório da aplicação
WORKDIR /meu_app

# Copiar Gemfile e Gemfile.lock
COPY ./meu_app/Gemfile* /meu_app/

# Instalar gems
RUN bundle install

# Copiar código
COPY ./meu_app /meu_app

# Criar entrypoint
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]