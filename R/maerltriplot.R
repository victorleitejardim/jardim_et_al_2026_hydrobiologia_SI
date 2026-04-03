
#' Maerl Triplots
#'
#' @param data dataframe with x and y already transformed as in (ref)
#' @param col aesthetics 
#' @param label aesthetics
#' @param shape aesthetics
#'
#' @return
#' @export
#'
#' @examples

require(ggrepel)
maerl.triplot <- function(data, col, label, shape){
  triplot <- ggplot()+ #Bosence Classes
    geom_polygon(aes(x = c(0, 1, .5, 0), y = c(0, 0, 1, 0)), fill = "white", colour = "grey35", linewidth = 1)+ #ggplot's defaut bg colour
    geom_segment(aes(x = .35, y = .7, xend = .65, yend = .7), linewidth = .8, colour = "grey35") +
    geom_segment(aes(x = .25, y = .5, xend = .5, yend = .35), linewidth = .8, colour = "grey35") +
    geom_segment(aes(x = .5, y = .35, xend = .75, yend = .5), linewidth = .8, colour = "grey35") +
    geom_segment(aes(x = .5, y = 0, xend = .5, yend = .35), linewidth = .8, colour = "grey35") +
    geom_segment(aes(x = .7, y = 0, xend = .85, yend = .3), linewidth = .8, colour = "grey35") +
    geom_segment(aes(x = .15, y = 0.3, xend = .3, yend = 0), linewidth = .8, colour = "grey35") +
    xlim(-0.25, 1.25) +
    geom_text(aes(label = "0.0", x = -.0975, y = 0), colour = "black", size = 11/.pt) +
    geom_text(aes(label = "0.3", x = .075, y = .3), colour = "black", size = 11/.pt) +
    geom_text(aes(label = "0.5", x = .175, y = .5), colour = "black", size = 11/.pt) +
    geom_text(aes(label = "0.7", x = .275, y = .7), colour = "black", size = 11/.pt) +
    geom_text(aes(label = "1.0", x = .425, y = 1), colour = "black", size = 11/.pt) +
    geom_text(aes(label = "1.0", x = 1.05, y = 0), colour = "black", size = 11/.pt, nudge_x = .05) +
    geom_text(aes(label = "0.7", x = .875, y = .3), colour = "black", size = 11/.pt, nudge_x = .05) +
    geom_text(aes(label = "0.5", x = .775, y = .5), colour = "black", size = 11/.pt, nudge_x = .05) +
    geom_text(aes(label = "0.3", x = .675, y = .7), colour = "black", size = 11/.pt, nudge_x = .05) +
    geom_text(aes(label = "0.0", x = .525, y = 1), colour = "black", size = 11/.pt, nudge_x = .05) +
    scale_x_continuous(breaks = c(.0, .3, .5, .7, 1))+
    theme(line = element_blank(), panel.background = element_rect(fill = NA), axis.title = element_blank(), legend.position = "top", panel.border = element_blank(), axis.text.y = element_blank(), axis.text.x = element_text(size = 11, vjust = , colour = "black"))
  
  classes <- data.frame(classes = c("SS", "SD", "SE"), x = c(.50, .35, .65), y = c(.55, .24, .24))
  triplot + geom_point(data = data, aes(x= x, y = y, col = col, shape = shape), size = 2.5)+
    #geom_text_repel(data  = data, aes(x= x, y = y, label = label), size = 3, parse = TRUE, box.padding = .5)+
    coord_fixed(clip = "off")+
    geom_text(data = classes, aes(x = x, y = y, label = classes), size = 18/.pt, fontface = "bold")+
    labs(x = "L-I/L-S", y = "")+
    annotate(x = .15, y = .55, geom = "text", label = "S/L", size = 20/.pt, angle = 60)+
    annotate(x = .85, y = .55, geom = "text", label = "I/L", size = 20/.pt, angle = -60)+
    annotate(x = -.1, y = -.05, geom = "text", label = "Discoidal", fontface="bold", size = 25/.pt)+
    annotate(x = 1.1, y = -.05, geom = "text", label = "Ellipsoidal", fontface="bold", size = 25/.pt)+
    annotate(x = .5, y = 1.05, geom = "text", label = "Spheroidal", fontface="bold", size = 25/.pt)
}
