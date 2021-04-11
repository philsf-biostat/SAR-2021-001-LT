# setup -------------------------------------------------------------------

width <- 7
height <- 7


# main figure -------------------------------------------------------------

ggsave(filename = "figures/overall.png",
       plot = print(gg.overal),
       width = width, height = height
       )

# additional figures ------------------------------------------------------

ggsave(
  filename = "figures/sex.png",
  plot = print(gg.sex),
  width = width, height = height
  )

ggsave(
  filename = "figures/sirs.png",
  plot = print(gg.sirs),
  width = width, height = height
  )

ggsave(
  filename = "figures/complication.png",
  plot = print(gg.comp),
  width = width, height = height
  )

ggsave(
  filename = "figures/joint.png",
  plot = print(gg.joint),
  width = width, height = height
  )

ggsave(
  filename = "figures/status.png",
  plot = print(gg.surg.success),
  width = width, height = height
)

ggsave(
  filename = "figures/result.png",
  plot = print(gg.outcome),
  width = width, height = height
  )

ggsave(
  filename = "figures/type.png",
  plot = print(gg.comp.type),
  width = width, height = height
  )

# competing risks ---------------------------------------------------------

ggsave(
  filename = "figures/competing-risks.png",
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

