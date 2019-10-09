# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mli <marvin@42.fr>                         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/10/07 17:22:00 by mli               #+#    #+#              #
#    Updated: 2019/10/08 12:48:59 by mli              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a

CC = gcc

INCL = -I ./includes/

CFLAGS = -Wall -Werror -Wextra ${INCL}

FILES = ft_memset.c \
			  ft_bzero.c \
			  ft_strlen.c \
			  ft_toupper.c \
			  ft_tolower.c 
	#		  ft_strchr.c 

SRCS_PATH = ./srcs/

SRCS_FILES = ${addprefix ${SRCS_PATH}, ${FILES}}

OBJS = ${SRCS_FILES:.c=.o}

$(NAME): ${OBJS} 
	ar rc ${NAME} ${OBJS}
	ranlib ${NAME}

all: ${NAME}

clean:
	rm -rf ${OBJS}

fclean: clean
	rm -rf ${NAME}

re: fclean all
