def Settings( **kwargs ):
    return {
        'flags': ['-x', 'c', '-Wall', '-Wextra', '-Werror',
                  '-I./libft', '-I../libft',
                  '-I./libft/includes', '-I../libft/includes',
                  '-I./includes', '-I../includes'
                  ],
    }
