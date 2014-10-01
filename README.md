# vagrant-node

vagrant-node is the virtual machine used for Node.js development.

## Installation

First of all you need to set up SSH agent forwarding for the key you use to authenticate with GitHub. Run

    $ ssh-add -l

and verify whether that key is listed. If so, everything is fine, if not, run the following command.

    $ ssh-add ~/.ssh/id_rsa

Next, you need to have [Vagrant](http://www.vagrantup.com/) and either VMware or VirtualBox installed. Once you have done this, you are ready to setup the virtual machine.

For that, first clone this repository. As the virtual machine will automatically provide all directories that share the same parent, you probably want to put it into a directory next to your projects' directories.

## Quick Start

To run the virtual machine, change to the directory you cloned into and run the following command.

    $ vagrant up

If you want to ssh into the virtual machine run the following command. Please note that insie of the virtual machine you will automatically be taken to the `~/projects` folder that contains all your projects.

    $ vagrant ssh

Apart from that, any other Vagrant command will work as well, such as `vagrant status`, `vagrant halt` or `vagrant destroy`.

### Verifying GitHub access

To verify that SSH agent forwarding was setup successfully, ssh into the virtual machine and run the following command.

    $ ssh -T git@github.com

If the output is

> Hi &lt;username&gt;! You've successfully authenticated, but GitHub does not provide shell access.

everything is fine. If not, please consider the documentation for SSH.

### Using Node.js

Inside of the virtual machine, Node.js has already been installed for you. Installation of Node.js is done using [nvm](https://github.com/creationix/nvm), so you can easily switch versions if necessary.

Additionally, the following CLI tools have been installed globally and are ready to use:

- [Browserify](http://browserify.org/)
- [ESLint](http://eslint.org/)
- [Grunt](http://gruntjs.com/)
- [Harp](http://harpjs.com/)
- [http-server](https://github.com/nodeapps/http-server)
- [Mocha](http://visionmedia.github.io/mocha/)
- [UglifyJS2](http://lisperator.net/uglifyjs/)

Where necessary, port forwardings for these tools have already been configured.

### Using Docker

Besides Node.js, Docker has been installed as well. You can use it using the usual Docker commands such as `docker run` or `docker ps`.

If you add custom Docker containers, you may need to adjust the port forwarding settings in the `Vagrantfile` file and recreate the virtual machine from scratch. Please note that forwarding UDP ports requires some special actions. For details see the Vagrant documentation on [forwarding ports](https://docs.vagrantup.com/v2/networking/forwarded_ports.html).

MongoDB and RabbitMQ are installed and run by default as Docker containers. Their ports are `27017` and `27018` respectively `5672` and `15672`. Port forwardings for these ports has also already been configured.

For both services, the username as well as the password have been set to `admin`.

Additionally, the virtual machine has the MongoDB client tools installed, so you can access MongoDB using the `mongo` command.

    $ mongo admin -u admin -p admin

## License

The MIT License (MIT)
Copyright (c) 2014 the native web.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
