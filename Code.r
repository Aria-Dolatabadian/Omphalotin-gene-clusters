#https://nvelden.github.io/geneviewer/articles/Examples.html

# install.packages("devtools")
# devtools::install_github("nvelden/geneviewer")

library(geneviewer)

ophA_clusters <- read.csv("ophA_clusters.csv")

GC_chart(ophA_clusters, 
         start = "start",
         end = "end",
         group = "class",
         cluster = "cluster") %>%
  GC_clusterFooter(
    title = c("<i>Omphalotus olearius</i>", "<i>Dendrothele bispora</i>"), 
    subtitle = c("Locus: 2,522 - 21,484", "Locus: 19,236 - 43,005"),
    align = "left",
    x = 50) %>%
  GC_legend(position = "top") %>%
  GC_labels(label = "name") %>%
  GC_scaleBar(y = 20) %>%
  GC_scale(cluster = 1, scale_breaks = TRUE, hidden = TRUE) %>%
  GC_scale(cluster = 2, reverse = TRUE, hidden = TRUE) %>%
  GC_tooltip(
    formatter = "<b>Gene:</b> {name}<br> <b>Start:</b> {start}<br><b>End:</b> {end}"
  )



  GC_chart(
    ophA_clusters,
    cluster = "cluster",
    group = "class",
    width = "800px",
    height = "400px"
  ) %>%
  GC_labels(
    cluster = 1,
    label = "name"
  ) %>%
  GC_links(
    "class",
    use_group_colors = FALSE,
    measure = "none",
    normal_color = "#969696",
    inverted_color = "#969696",
    curve = TRUE,
    label = FALSE,
    linkWidth = 0.2,
  ) %>%
  GC_links(
    group = "name",
    value1 = "ophA",
    value2 = "dbophA",
    use_group_colors = TRUE,
    linkStyle = list(
      stroke = "black",
      strokeWidth = 2
    )
  ) %>%
  GC_clusterLabel(
    title = c("<i>O.</i> <i>olearius</i>", "<i>D. bispora</i>"),
    wrapLabel = FALSE
  ) %>%
  # Reduce space between legend and cluster
  GC_grid(
    cluster = 2,
    height = "25%"
  ) %>%
  GC_legend(
    legendTextOptions = list(fontSize = "14px")
  ) %>%
  GC_annotation(
    cluster = 1,
    x = 10884,
    y = 11,
    type = "text",
    text = "90%",
    style = list(fontSize = "16px", fill = "#1c641c")
  ) %>%
  GC_trackMouse()

