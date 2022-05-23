#!/bin/bash

echo "What will be the name of your executable ?"
read NAME
echo "Folder of the libft (type [ENTER] if you don't use it)."
read LIBFT_DIR
echo "Folder of the minilibx (type [ENTER] if you don't use it)."
read MLX_DIR
echo "What compiler do you use ?"
read CC
echo "Choose your flags."
read CFLAGS
echo "Where are you headers file ?"
read INC_DIR

echo "Generating Makefile..."

touch Makefile
echo "# Makefile generate by afaby" > Makefile
echo "" >> Makefile
echo "# Name of the executable" >> Makefile
echo "NAME	=	${NAME}" >> Makefile
echo "" >> Makefile
echo "# Path of the libft" >> Makefile
echo "LIBFT_DIR	=	${LIBFT_DIR}" >> Makefile
echo "LIBFT		=	-I \$(LIBFT_DIR) -L \$(LIBFT_DIR) -lft" >> Makefile
echo "" >> Makefile
echo "# Minilibx use" >> Makefile
echo "MLX_DIR	=	${MLX_DIR}" >> Makefile
echo "MLX		=	-I \$(MLX_DIR) -L \$(MLX_DIR) -lmlx -lXext -lX11 -lm" >> Makefile
echo "" >> Makefile
echo "# Path of your headers" >> Makefile
echo "INC_DIR	=	${INC_DIR}" >> Makefile
echo "INC		=	-I \$(INC_DIR)" >> Makefile
echo "" >> Makefile
echo "# Compiler to use" >> Makefile
echo "CC		=	${CC}" >> Makefile
echo "" >> Makefile
echo "# Flags to use" >> Makefile
echo "CFLAGS	=	${CFLAGS}" >> Makefile
echo "" >> Makefile
echo "# All the sources" >> Makefile
SRCS=$(find -name "*.c")
for SRC in ${SRCS}
do
	if [ ${SRC} == $(find -name "*.c" | head -n 1) ]
	then
		echo "SRCS	=	${SRC} \\" >> Makefile
	elif [[ "$SRC" != *"libft"* ]] && [[ "$SRC" != *"minilibx"* ]]
	then
		echo "			${SRC} \\" >> Makefile
	fi
done
echo "" >> Makefile
echo "" >> Makefile
echo "" >> Makefile
echo "" >> Makefile

echo "all: \$(NAME)" >> Makefile
echo "" >> Makefile
echo "\$(NAME):" >> Makefile
echo "	make -C \$(LIBFT_DIR)" >> Makefile
echo "	make -C \$(MLX_DIR)" >> Makefile
if [[ -z ${MLX_DIR} ]] && [[ -z ${LIBFT_DIR} ]]
then
	echo "	\$(CC) \$(CFLAGS) \$(SRCS) -o \$(NAME) \$(INC)" >> Makefile
elif [[ -z ${MLX_DIR} ]] && [[ ! -z ${LIBFT_DIR} ]]
then
	echo "	\$(CC) \$(CFLAGS) \$(SRCS) -o \$(NAME) \$(INC) \$(LIBFT)" >> Makefile
elif [[ ! -z ${MLX_DIR} ]] && [[ -z ${LIBFT_DIR} ]]
then
	echo "	\$(CC) \$(CFLAGS) \$(SRCS) -o \$(NAME) \$(INC) \$(MLX)" >> Makefile
else
	echo "	\$(CC) \$(CFLAGS) \$(SRCS) -o \$(NAME) \$(INC) \$(LIBFT) \$(MLX)" >> Makefile
fi
echo "" >> Makefile
echo "clean:" >> Makefile
echo "	make clean -C \$(LIBFT_DIR)" >> Makefile
echo "	make clean -C \$(MLX_DIR)" >> Makefile
echo "" >> Makefile
echo "fclean : clean" >> Makefile
echo "	make fclean -C \$(LIBFT_DIR)" >> Makefile
echo "	rm -f \$(NAME)" >> Makefile
echo "" >> Makefile
echo "re : fclean all" >> Makefile
echo "" >> Makefile
echo ".PHONY: re fclean clean all" >> Makefile
echo "\nMakefile generated !"
