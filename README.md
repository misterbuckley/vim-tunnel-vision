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

Put the following mappings in your .vimrc:

    nmap gt <Plug>(EnterTunnel)
    vmap gt <Plug>(EnterTunnel)

Then, either visually select a block of text to focus on and press `gt` or press `gt` in normal mode followed by a motion to focus on that block of text.

The block of text you have selected will be copied to a scratch buffer where those lines are all you see, allowing you to focus on that smaller chunk of text.

When you are done editing in this new buffer, hit `:w` to exit the tunnel. This will copy your newly edited text back to the original buffer that you came from and destroy the scratch buffer. Note that this does not save the original buffer.

It's as simple as that.
