/*******************************************************************************
 * Copyright (c) 2011, Johns Hopkins University
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * Neither the name of the Johns Hopkins University nor the
 *       names of its contributors may be used to endorse or promote products
 *       derived from this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL Johns Hopkins University BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 ******************************************************************************/
package edu.jhu.pha.vospace.node;

import org.apache.log4j.Logger;

import edu.jhu.pha.vospace.api.exceptions.InternalServerErrorException;
import edu.jhu.pha.vospace.api.exceptions.NotFoundException;
import edu.jhu.pha.vospace.meta.MetaStore;
import edu.jhu.pha.vospace.meta.MetaStoreFactory;

/** 
 * A factory for creating nodes
 */
public class NodeFactory {
	private static NodeFactory ref;
	private static final Logger logger = Logger.getLogger(NodeFactory.class);
	private NodeFactory() {}

	/*
	 * Get a NodeFactory
	 */
	public static NodeFactory getInstance() {
		if (null == ref) ref = new NodeFactory();
		return ref;
	}
	
	public static Node createNode(VospaceId uri, String username, NodeType type) {
		Node node = null;
		try {
			Class nodeClass = type.getNodeClass();
			node = (Node) nodeClass.getConstructor(VospaceId.class, String.class).newInstance(uri, username);
		} catch (Exception e) {
			throw new InternalServerErrorException("InternalFault");
		}
		return node;
	}
	
	public static Node getNode(VospaceId uri, String username) {
		MetaStore metastore = MetaStoreFactory.getInstance().getMetaStore(username);
		if(null == uri)
			throw new NotFoundException("NodeNotFound");
		NodeType type = metastore.getType(uri);
		return createNode(uri, username, type);
	}
	
}