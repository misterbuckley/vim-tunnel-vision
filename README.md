# vim-tunnel-vision

Narrow your vision to focus on a smaller chunk of a buffer.

<img src="img/example.gif?raw=true" alt="Example usage" title="Example usage">

## Installation

Install it however you usually install plugins.

For example, if you use [Vim-Plug](https://github.com/junegunn/vim-plug), simply add to your vimrc:

    Plug 'misterbuckley/vim-tunnel-vision'

[Pathogen](https://github.com/tpope/vim-pathogen) users:

    cd ~/.vim/bundle
    git clone https://github.com/misterbuckley/vim-tunnel-vision.git

## Usage

Put mappings such as the following in your .vimrc:

    nmap <Leader>t <Plug>(EnterTunnel)
    vmap <Leader>t <Plug>(EnterTunnel)

Then, either visually select a block of text to focus on and press `<Leader>t` or press `<Leader>t` in normal mode followed by a motion to focus on that block of text.

The block of text you have selected will be copied to a scratch buffer where those lines are all you see, allowing you to focus on that smaller chunk of text.

When you are done editing in this new buffer, hit `:w` to exit the tunnel. This will copy your newly edited text back to the original buffer that you came from and destroy the scratch buffer.

It's as simple as that.

## Settings

####  g:tv_write_immediately

Normally when exiting the tunnel with `:w`, your new changes will not immediately be saved in the original buffer. If `g:tv_write_immediately` is set to a number greater than zero, your changes will immediately be saved in the original buffer (as if you did another `:w`).
