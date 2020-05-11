def Settings( **kwargs ):
    return {
        'flags': ['-x', 'c', '-Wall', '-Wextra', '-Werror',
                  '-I./libft', '-I./includes', '-I../libft', '-I../includes'],
    }
