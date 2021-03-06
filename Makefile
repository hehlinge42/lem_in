# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sikpenou <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/04/02 21:32:05 by sikpenou          #+#    #+#              #
#    Updated: 2020/01/13 15:33:24 by sikpenou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = gcc

CFLAGS = -Wall -Wextra -Werror -g3 #-fsanitize=address

NAME = lem-in

SRCS = $(addprefix $(SRC_DIR), $(SRC_FILES))

SRC_FILES =	main_lem.c							\
			init_structs_lem.c					\
			init_display_structs_lem.c			\
			exit_lem.c							\
			free_lem_paths.c					\
			parser_lem.c						\
			set_graph.c							\
			set_lvl.c							\
			clean_graph.c						\
			seek_paths.c 						\
			try_path.c	 						\
			manage_config.c						\
			update_best_config.c				\
			load_balancing.c					\
			debug_display_config_lem_lvl_lem.c	\
			debug_rooms_lem.c				\
			debug_paths.c						\
			set_display.c						\
			display_lem.c						\
			get_anthill.c						\
			get_rooms.c							\
			get_tubes.c

SRC_DIR = ./srcs/

OBJS = $(addprefix $(OBJ_DIR), $(OBJ_FILES))

OBJ_FILES = $(SRC_FILES:.c=.o)

OBJ_DIR = objs/

INCLS = $(INC_DIR)lem_in.h

INC_DIR = includes/

LIB = $(addprefix $(LIB_DIR), libft.a)

LIB_INCLS = $(LIB_DIR)$(INC_DIR)

LIB_DIR = libft/

all: $(NAME)

$(NAME): $(INCLS) $(LIB_INCLS) $(SRCS) $(LIB) Makefile
	@/bin/echo "make $(notdir $(NAME))"
	@rm -f auteur
	@echo sikpenou > auteur
	@echo hehlinge >> auteur
	@mkdir -p objs
	@make -j --no-print-directory objects
	@$(CC) $(CFLAGS) -I $(INC_DIR) -o $@ $(OBJS) $(LIB)

$(LIB): FORCE
	@make -j --no-print-directory -C $(LIB_DIR)

objects: $(OBJS)

$(OBJ_DIR)%.o: $(SRC_DIR)%.c $(INCLS)
	@$(CC) $(CFLAGS) -I $(INC_DIR) -I $(LIB_INCLS) -o $@ -c $<

clean: FORCE
	@/bin/echo "make clean $(notdir $(NAME))"
	@rm -rf $(OBJ_DIR)
	@make clean -j --no-print-directory -C $(LIB_DIR)

fclean: clean
	@/bin/echo "make fclean $(notdir $(NAME))"
	@make fclean -j --no-print-directory -C $(LIB_DIR)
	@rm -f $(NAME)


re: FORCE
	@/bin/echo "make re $(notdir $(NAME))"
	@make -j --no-print-directory fclean
	@make -j --no-print-directory all

FORCE:

#.SILENT:
