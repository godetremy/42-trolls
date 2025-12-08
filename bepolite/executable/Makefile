NAME=BePolite

SRCS=main.c
OBJS=$(SRCS:.c=.o)

CC=cc
CFLAGS=-Wall -Wextra -Werror

LDFLAGS=-lSDL2

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) $(OBJS) -o $(NAME) $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re