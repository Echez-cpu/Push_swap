/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: pokpalae <pokpalae@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/03/12 15:24:40 by pokpalae          #+#    #+#             */
/*   Updated: 2024/03/28 15:40:25 by pokpalae         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../includes/push_swap.h"

static void	cheecker(char **argv)
{
	int	c;
	int	n;

	c = 1;
	n = 0;
	while (argv[c])
	{
		n = 0;
		while (argv[c][n])
		{
			if (argv[c][n] != 32 && argv[c][n] != '\t')
				break ;
			n++;
		}
		if (!argv[c][n])
		{
			write(2, "Error\n", 6);
			exit(1);
		}
		c++;
	}
}

int	main(int argc, char **argv)
{
	t_stack_node	*a;
	t_stack_node	*b;

	a = NULL;
	b = NULL;
	if (argc == 1)
		return (0);
	cheecker(argv);
	argv = join_argv(argv);
	init_stack_a(&a, argv);
	free_split(argv);
	if (!stack_sorted(a))
	{
		if (stack_len(a) == 2)
			sa(&a, false);
		else if (stack_len(a) == 3)
			sort_three(&a);
		else
			sort_stacks(&a, &b);
	}
	free_stack(&a);
}
