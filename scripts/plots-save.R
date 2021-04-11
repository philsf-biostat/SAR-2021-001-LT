# setup -------------------------------------------------------------------

width <- 7
height <- 7


# main figure -------------------------------------------------------------

ggsave(filename = "figures/death_PJI.png",
       plot = print(gg.overal),
       width = width, height = height
       )

# additional figures ------------------------------------------------------

ggsave(
  filename = "figures/Sex.png",
  plot = print(gg.Sex),
  width = width, height = height
  )

ggsave(
  filename = "figures/sirs.png",
  plot = print(gg.sirs),
  width = width, height = height
  )

ggsave(
  filename = "figures/Complication.png",
  plot = print(gg.Complication),
  width = width, height = height
  )

ggsave(
  filename = "figures/Joint.png",
  plot = print(gg.Joint),
  width = width, height = height
  )

ggsave(
  filename = "figures/surg_success.png",
  plot = print(gg.surg.success),
  width = width, height = height
)

ggsave(
  filename = "figures/surg_type.png",
  plot = print(gg.surg.type),
  width = width, height = height
  )

# ggsave(
#   filename = "figures/comp_type.png",
#   plot = print(gg.comp.type),
#   width = width, height = height
#   )

# competing risks ---------------------------------------------------------

ggsave(
  filename = "figures/death_all.png",
  plot = print(gg.cr),
  width = width, height = height
)

# png("figures/competing-risks.png", width = 600, height = 600)
# plot(cr,
#      curvlab = c("Survived", "Other causes of death", "PJI confirmed death"),
#      lwd = c(1, 2, 2),
#      col = c(1, 3, 2),
#      lty = 3:1,
#      main = "Competing risks of death after TJA",
#      xlab = "Months post PJI diagnosis",
#      ylab = "Cumulative incidence"
# )
# dev.off()

