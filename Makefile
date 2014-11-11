# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aalliot <aalliot@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2014/11/10 11:30:22 by aalliot           #+#    #+#              #
#    Updated: 2014/11/11 12:57:39 by aalliot          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= libft.a
SRC		= ft_toupper.c ft_tolower.c ft_strtrim.c ft_strsub.c ft_strstr.c \
		  ft_strrchr.c ft_strnstr.c ft_strnew.c ft_strnequ.c ft_strncpy.c \
		  ft_strncmp.c ft_strncat.c ft_strmapi.c ft_strmap.c ft_strlen.c \
		  ft_strlcat.c ft_strjoin.c ft_striteri.c ft_striter.c ft_strequ.c \
		  ft_strdup.c ft_strdel.c ft_strcpy.c ft_strcmp.c ft_strclr.c \
		  ft_strchr.c ft_strcat.c ft_putstr_fd.c ft_putstr.c ft_putnbr_fd.c \
		  ft_putnbr.c ft_putendl_fd.c ft_putendl.c ft_putchar_fd.c \
		  ft_putchar.c ft_memset.c ft_memmove.c ft_memdel.c ft_memcpy.c \
		  ft_memcmp.c ft_memchr.c ft_memccpy.c ft_memalloc.c ft_isprint.c \
		  ft_isdigit.c ft_isascii.c ft_isalpha.c ft_isalnum.c ft_bzero.c \
		  ft_atoi.c ft_strsplit.c ft_itoa.c
OBJ		= $(SRC:.c=.o)
CC		= gcc
FLAGS	= -Wall -Werror -Wextra

all: $(NAME)

$(NAME): $(OBJ)
	@ar rc $(NAME) $(OBJ)
	@ranlib $(NAME)

%.o: %.c
	@$(CC) -I . -o $@ -c $? $(FLAGS)

.PHONY: clean fclean re test test2 testall

clean:
	@rm -f $(OBJ)

fclean: clean
	@rm -f $(NAME)

testall: test test2

test: re $(NAME)
	curl -s http://pastebin.com/raw.php?i=p3BBP70K > main.c
	gcc -I . main.c libft.a
	rm main.c
	./a.out

test2: re
	curl -s http://pastebin.com/raw.php\?i\=KQRs4L2H > main.c
	gcc -I . main.c libft.a
	rm main.c
	./a.out

test3: re
	gcc -Wall -Wextra -Werror -I . main.c libft.a
	./a.out

re: fclean all
