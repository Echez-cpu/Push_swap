# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pokpalae <pokpalae@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/12 15:46:23 by pokpalae          #+#    #+#              #
#    Updated: 2024/03/28 19:36:46 by pokpalae         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


NAME				= push_swap

LIBFT				= ./libft/libft.a
INC					= inc/
SRC_DIR				= src/
OBJ_DIR				= obj/

CC					= gcc
CFLAGS				= -Wall -Werror -Wextra -I
RM					= rm -f

COMMANDS_DIR		=	$(SRC_DIR)rules/push.c \
						$(SRC_DIR)rules/rev_rotate.c \
						$(SRC_DIR)rules/rotate.c \
						$(SRC_DIR)rules/sort_stacks.c \
						$(SRC_DIR)rules/sort_three.c \
						$(SRC_DIR)rules/swap.c

PUSH_SWAP_DIR		=	$(SRC_DIR)main/handle_errors.c \
						$(SRC_DIR)main/a_to_b.c \
						$(SRC_DIR)main/b_to_a.c \
						$(SRC_DIR)main/main.c \
						$(SRC_DIR)main/ftt_split.c \
						$(SRC_DIR)main/stack_init.c \
						$(SRC_DIR)main/stack_utils.c \
						$(SRC_DIR)main/join_argv_free.c

SRCS 				= $(COMMANDS_DIR) $(PUSH_SWAP_DIR)

OBJ 				= $(patsubst $(SRC_DIR)%.c,$(OBJ_DIR)%.o,$(SRCS))

start:				
					@make all

$(LIBFT):
					@make -C ./libft

all: 				$(NAME)

$(NAME): 			$(OBJ) $(LIBFT)
					@$(CC) $(CFLAGS) $(INC) $(OBJ) $(LIBFT) -o $(NAME)

$(OBJ_DIR)%.o:		$(SRC_DIR)%.c 
					@mkdir -p $(@D)
					@$(CC) $(CFLAGS) $(INC) -c $< -o $@

clean:
					@$(RM) -r $(OBJ_DIR)
					@make clean -C ./libft

fclean: 			clean
					@$(RM) $(NAME)
					@$(RM) $(LIBFT)

re: 				fclean all

.PHONY: 			start all clean fclean re