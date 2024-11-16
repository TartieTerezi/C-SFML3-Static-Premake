#include "corepch.h"
#include "Core/Core.h"

int main()
{
	HelloFromCore();

	sfRenderWindow* window = sfRenderWindow_create((sfVideoMode) { 800, 600, 32 }, "SFML Window", sfClose, NULL);

	while (sfRenderWindow_isOpen(window))
	{
		sfEvent event;
		while (sfRenderWindow_pollEvent(window, &event))
		{
			if (event.type == sfEvtClosed) sfRenderWindow_close(window);
		}

		sfRenderWindow_clear(window, sfBlack);

		sfRenderWindow_display(window);
	}

	sfRenderWindow_destroy(window);
	return 0;
}