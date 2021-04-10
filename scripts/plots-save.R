ggsave(filename = "figures/overall.png",
       plot = print(gg.overal),
       width = 7, height = 7
       )

ggsave(
  filename = "figures/sex.png",
  plot = print(gg.sex),
  width = 7, height = 7
  )

ggsave(
  filename = "figures/sirs.png",
  device = print(gg.sirs),
  width = 7, height = 7
  )

ggsave(
  filename = "figures/complication.png",
  plot = print(gg.comp),
  width = 7, height = 7
  )

ggsave(
  filename = "figures/joint.png",
  plot = print(gg.joint),
  width = 7, height = 7
  )

ggsave(
  filename = "figures/status.png",
  plot = print(gg.stat.tja),
  width = 7, height = 7
)

ggsave(
  filename = "figures/result.png",
  plot = print(gg.outcome),
  width = 7, height = 7
  )

ggsave(
  filename = "figures/type.png",
  plot = print(gg.comp.type),
  width = 7, height = 7
  )

# competing risks ---------------------------------------------------------

png("figures/competing-risks.png", width = 600, height = 600)
plot(cr,
     curvlab = c("Survived", "Other causes of death", "PJI confirmed death"),
     lwd = c(1, 2, 2),
     col = c(1, 3, 2),
     lty = 3:1,
     main = "Competing risks of death after TJA",
     xlab = "Months post PJI diagnosis",
     ylab = "Cumulative incidence"
)
dev.off()
