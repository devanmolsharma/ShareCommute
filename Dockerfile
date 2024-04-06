# Dockerfile.rails
FROM ruby:3.3.0

# Default directory
ENV INSTALL_PATH /opt/app
RUN mkdir -p $INSTALL_PATH

# Install rails
RUN gem install rails bundler
#RUN chown -R user:user /opt/app
WORKDIR /opt/app
COPY . /opt/app
EXPOSE 3000

RUN bundle install
# RUN bin/rake db:migrate db:seed
# Run a shell
CMD ["bin/rails","s" , "-b","0.0.0.0"]