#!/bin/bash

echo "What will be the name of your executable ?"
read NAME
echo "Folder of the libft (type [ENTER] if you don't use it)."
read LIBFT
echo "Folder of the minilibx (type [ENTER] if you don't use it)."
read MLX
echo "What compiler do you use ?"
read CC
echo "Choose your flags."
read CFLAGS
echo "Where are you headers file ?"
read INC

touch Makefile
echo "# Makefile generate by afaby" > Makefile
echo "" >> Makefile
echo "# Name of the executable" >> Makefile
echo "NAME	=	${NAME}" >> Makefile
echo "" >> Makefile
echo "# Path of the libft" >> Makefile
echo "LIBFT	=	-I${LIBFT} -L${LIBFT} -lft" >> Makefile
echo "" >> Makefile
echo "# Minilibx use" >> Makefile
echo "MLX		=	-I${MLX} -L${MLX} -lmlx -lXext -lX11 -lm" >> Makefile
echo "" >> Makefile
echo "# Path of your headers" >> Makefile
echo "INC		=	-I${INC}" >> Makefile
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
	else
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
echo "	make -C ${LIBFT}" >> Makefile
echo "	make -C ${MLX}" >> Makefile
echo "	\$(CC) \$(CFLAGS) \$(SRCS) -o \$(NAME) \$(INC) \$(LIBFT) \$(MLX)" >> Makefile
echo "" >> Makefile
echo "clean:" >> Makefile
echo "	make clean -C \$(LIBFT)" >> Makefile
echo "	make clean -C \$(MLX)" >> Makefile
echo "" >> Makefile
echo "fclean : clean" >> Makefile
echo "	make fclean -C \$(LIBFT)" >> Makefile
echo "	make fclean -C \$(MLX)" >> Makefile
echo "	rm -f \$(NAME)" >> Makefile
echo "" >> Makefile
echo "re : fclean all" >> Makefile
echo "" >> Makefile
echo ".PHONY: re fclean clean all" >> Makefile
