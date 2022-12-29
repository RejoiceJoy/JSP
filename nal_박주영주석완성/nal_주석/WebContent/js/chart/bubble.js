$(function () {

	showTopicCountBubble = function(data) {
		
		var overFlag = false;
		var timer;
		var selectID;
		var w, h;
			w = $("#search_graph_box").width();
			h = $("#search_graph_box").height();
		
		var diameter = 960,
		    format = d3.format(",d"),
		    color = d3.scale.category20c();
		
		var bubble = d3.layout.pack()
		    .sort(null)
		    .size([w, h])
		    .padding(1.0);
		
		  svg = d3.select("#search_graph_box").append("svg")
		  	.attr("id", "svg1")
		    .attr("width", w)
		    .attr("height", h)
		    .attr("overflow", "hidden")
		    .attr("class", "bubble");
		  
		  root = data.result;
		  update();
		 
		  d3.select(self.frameElement).style("height", h + "px");
		  
		// 차트그리기
		function update() {
		  node = svg.selectAll(".node")
					.data(bubble.nodes(classes(root))
					.filter(function(d) { return !d.children; }))
					.enter().append("a") //g 수정20191209
					.attr("id", function(d){
						return d.id;
					})
					.attr("class", "node")
					.attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; })
					
					//20191209 추가
//					.on("click", nodeClick) 
					.attr("href", function(d){
						 var href;
						 href = "javascript:wordSearch('"+d.className+"');";
						return href;
					})
					.attr("title", "새창열림")
					
					.on("mouseover", mouseOver)
					.on("mouseout", mouseOut);

		  // 테두리용
		  node.append("circle")
			  .attr("class", "circle_stroke")
		      .attr("r", function(d) {
		    	  var size = 0;
		    	  if(d.id == 'node1') {
		    		  size = d.r+0.4;
		    	  }
		    	  return size;
		      })
		      .style("fill", function(d) { 
		    	  return "#4c6665";
		  });
		
		  node.append("title").text(function(d) { return d.className; });
		  
		  //20191209 추가
		  node.append("label")
	      .attr("class", "blind")
		  .attr("for", function(d){
			  return d.id.substring(4,d.id.length);
		   })
	      .text(function(d) {
	    	  if(d.id == 'node1') {
	    		  if(d.className.length >= 8) {
	    			  return d.className.substring(0, d.r / 8) + "..";
	    		  } else {
	    			  return d.className.substring(0, d.r / 8);
	    		  }
	    	  } else {
	    		  if(d.r < 24 && d.r > 12) {
	    			  return d.className.substring(0, d.r / 4);
		    	  } else if(d.r <= 12 && d.r > 6) {
		    		  return d.className.substring(0, d.r / 2);
		    	  } else if(d.r <= 6) {
		    		  return d.className;
		    	  }
	    		  return d.className.substring(0, d.r / 6);
	    	  }
	      });
		  
		
		  // 배경용
		  node.append("circle")
		  	  .attr("class", "circle_ground")
		      .attr("r", function(d) {
		    	  if(d.id == 'node1') {
		    		  return d.r;
		    	  } else {
		    		  return d.r;
		    	  }
		      })
		      .style("fill", function(d) { 
				  /*var color;
				  if(d.className == data.searchTerm) {
						co = "#eeeeee";
				  } else {
					  co = color(d.packageName);
				  }
				  return co;*/
		    	  return d.color;
				});
		
		  node.append("text")
		  	  .attr("dy", ".3em")
		      .attr("class", "text_bubble")
		      .style("font-size", function(d) {
		    	  var size = "12px";
		    	  if(d.id == 'node1') {
		    		  size = "16px";
		    	  }
		    	  if(d.r < 24 && d.r > 12) {
		    		  size = "10px";
		    	  } else if(d.r <= 12 && d.r > 6) {
		    		  size = "8px";
		    	  } else if(d.r <= 6) {
		    		  size = "6px";
		    	  }
		    	  return size;
		      })
		      .style("font-weight", function(d) {
		    	  var weight;
		    	  if(d.id == 'node1') {
		    		  weight = "bold";
		    	  }
		    	  return weight;
		      })
		      .style("fill", function(d) {
		    	  var color = "#000";
		    	  if(d.id != 'node1') {
		    		  color = "#fff";
		    	  }
		    	  return color;
		      })
		      //id추가
		      .attr("id", function(d){
		    	  return d.id.substring(4,d.id.length);
		      })		      
		      .text(function(d) {
		    	  if(d.id == 'node1') {
		    		  if(d.className.length >= 8) {
		    			  return d.className.substring(0, d.r / 8) + "..";
		    		  } else {
		    			  return d.className.substring(0, d.r / 8);
		    		  }
		    	  } else {
		    		  if(d.r < 24 && d.r > 12) {
		    			  return d.className.substring(0, d.r / 4);
			    	  } else if(d.r <= 12 && d.r > 6) {
			    		  return d.className.substring(0, d.r / 2);
			    	  } else if(d.r <= 6) {
			    		  return d.className;
			    	  }
		    		  return d.className.substring(0, d.r / 6);
		    	  }
		      });
		  
		}
		
		// Returns a flattened hierarchy containing all leaf nodes under the root.
		function classes(root) {
		  var classes = [], i = 0;
		
		  function recurse(name, node) {
		    if (node.children) node.children.forEach(function(child) { recurse(node.name, child); });
		    else classes.push({packageName: name, className: node.name, value: node.size, id: 'node' + ++i, color:node.color});
		  }
		
		  recurse(null, root);
		  return {children: classes};
		}
		
		// 마우스 클릭 시
		function nodeClick(d) {
		  if (d3.event.defaultPrevented) return;
		  
		 // var term = d.className;
		  var term = d;
    	  if(term.indexOf('(') > 0) {
			term = term.substring(0, term.indexOf('('));
    	  }
		  
          $('#chartQuery').val(term);
          $('#frmNanetSearch').attr('action','http://dl.nanet.go.kr/SearchList.do');
          $('#frmNanetSearch').attr('target', '_blank');
          $('#frmNanetSearch').submit();

		}
		
		// 마우스 오버시
		function mouseOver(d) {
			overFlag = true;
			
			var strD = d;
			if(overFlag) {
				timer = setTimeout(function() {
		        	var dd = strD;
		        	mouseOverAction(dd);
		        }, 300);
			}
			
		}
		
		// 마우스 오버시
		function mouseOverAction(d) {
			
			clearTimeout(timer);
			
			if(d.id != 'node1' && overFlag) {
				d3.select("#"+d.id).select(".circle_ground").transition()
				.attr("r", function(d) {
					if(d.r > d.className.length * 10) {
						return d.r * 1.5; 
					} else {
						return d.className.length * 10;
					}
				});
				
				// 지연
				var start = new Date().getTime();
				while(new Date().getTime() < start + 100);
				
				d3.select("#"+d.id).select("text")
				.attr("dy", ".3em")
			    .style("text-anchor", "middle")
			    .style("font-size", function(d) {
		    		return "16px";
			    })
			    .text(function(d) {
			    	if(d.id == 'node1') {
			    		return d.className.substring(0, d.r / 8);
			    	} else {
			    		return d.className;
			    	}
			    });
				
				svg.selectAll('.node')
		        .sort(function(a, b) {
		          if (a.id === d.id) {
		            return 1;
		          } else {
		            if (b.id === d.id) {
		              return -1;
		            } else {
		              return 0;
		            }
		          }
		        });
			}
			
			overFlag = false;
			
		}
		
		// 마우스 아웃 시
		function mouseOut(d) {
			overFlag = false;
			clearTimeout(timer);
			
			d3.select("#"+d.id).select(".circle_ground").transition()
			.attr("r", function(d) { 
		    	  return d.r;
			});
			
			d3.select("#"+d.id).select("text")
			.attr("dy", ".3em")
		    .style("text-anchor", "middle")
		    .style("font-size", function(d) {
		    	var size = "12px";
		    	if(d.id == 'node1') {
		    	 size = "16px";
		    	}
		    	if(d.r < 24 && d.r > 12) {
		    	 size = "10px";
		    	} else if(d.r <= 12 && d.r > 6) {
		    	 size = "8px";
		    	} else if(d.r <= 6) {
		    	 size = "6px";
		    	}
		    	return size;
		    })
		    .text(function(d) {
		    	if(d.id == 'node1') {
		    		if(d.className.length >= 8) {
		    		  return d.className.substring(0, d.r / 8) + "..";
		    		} else {
		    		  return d.className.substring(0, d.r / 8);
		    		}
		    	} else {
		    	    if(d.r < 24 && d.r > 12) {
		    		  return d.className.substring(0, d.r / 4);
			    	} else if(d.r <= 12 && d.r > 6) {
			    	  return d.className.substring(0, d.r / 2);
			    	} else if(d.r <= 6) {
			    	  return d.className;
			    	}
		    		return d.className.substring(0, d.r / 6);
		    	}
		    });
		}
		
	};	
	
});	