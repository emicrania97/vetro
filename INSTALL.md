# Linux

	sudo apt-get install make gcc bison git python python-setuptools

	git clone git://github.com/bentley/rgbds.git
	cd rgbds
	sudo make install
	cd ..

	git clone --recursive git://github.com/emicrania97/vetro.git
	cd pokecrystal

Per compilare **pokecrystal.gbc**:

	make


# OS X

Su 10.8 o inferiore, scarica e installa **Command Line Tools for Xcode**.

Su 10.9 o successivo:

	xcode-select --install

Nella shell esegui:

	git clone git://github.com/bentley/rgbds.git
	cd rgbds
	sudo make install
	cd ..

	git clone --recursive git://github.com/emicrania97/vetro.git
	cd pokecrystal

Per compilare **pokecrystal.gbc**:

	make


# Windows

Per compilare su Windows, usa [**Cygwin**](http://cygwin.com/install.html) (32-bit).

Nell'installer, seleziona i seguenti pacchetti: `make` `git` `python` `python-setuptools` `gcc` `libsasl2` `ca-certificates`

Puoi usare python-setuptools direttamente da easy_install, ma consigliamo di usare pip.  Per installare pip, esegui `easy_install pip`.  Quando finisce, esegui

	pip install pypng

Se invece non vuoi installare pip, allora esegui

	easy_install pypng

A questo punto installa l'ultima versione di [**rgbds**](https://github.com/bentley/rgbds/releases/).
Metti `rgbasm.exe`, `rgblink.exe` e `rgbfix.exe` in `C:\cygwin\usr\local\bin`.

Nel **terminale di Cygwin**:

	git clone --recursive git://github.com/emicrania97/vetro.git
	cd pokecrystal

Per compilare:

	make


# Vagrant

Il metodo più semplice per compilare pokecrystal è usare Vagrant e
VirtualBox. Segui i procedimenti sottostanti:

* [Scarica e installa Vagrant](http://www.vagrantup.com/downloads.html)
* Segui le istruzioni per [scaricare e installare VirtualBox](http://docs-v1.vagrantup.com/v1/docs/getting-started/)
* Esegui questi comandi:

```
	vagrant box add pokecrystal http://diyhpl.us/~bryan/irc/pokecrystal/pokecrystal.box
	mkdir vagrantbox
	cd vagrantbox
	vagrant init pokecrystal
	vagrant up
	vagrant ssh -c "cd /vagrant && git clone --recursive git://github.com/emicrania97/vetro.git"
	vagrant ssh
```

Eseguendo "vagrant ssh" ti apparirà una shell in cui dovrai inserire i comandi per compilare
il codice. Quindi la directory "virtualbox" sull'host apparirà come una cartella condivisa
dentro la macchina virtuale guest "/vagrant".

Per compilare il progetto, esegui questi comandi nel guest (tutto ciò dentro "vagrant
ssh"):

	cd /vagrant/pokecrystal
	make
