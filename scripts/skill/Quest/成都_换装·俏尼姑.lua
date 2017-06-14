------------------------------------------------
-- 文件名    :  成都_换装·俏尼姑.lua
-- 创建人    :  张豪
-- 创建时间  :  2011-04-01
------------------------------------------------

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	if not IsPlayer(nCharacterID) then
        return
    end
    local player = GetPlayer(nCharacterID)
    if not player then
    	return
    end
    local scene = player.GetScene()
    if not scene then
    	return
    end

	local npc_cd = scene.GetNpcByNickName("chengdulaotou_cd")	
	if npc_cd and npc_cd.GetCustomInteger4(24) == player.dwID then
		local npc_cang = scene.GetNpcByNickName("chengdulaotou_cang")
		if npc_cang then 
			player.DelBuff(2697, 1)--破绽
			npc_cang.SetForceID(28)
			npc_cang.ModifyThreat(player.dwID, 30)
			npc_cang.SayTo(player.dwID,GetEditorString(1, 4727))
			npc_cang.DelBuff(2702, 1)--即将识破
			npc_cang.DelBuff(2703, 1)--去除中计
			npc_cang.DelBuff(2690, 1)--去酒
			npc_cang.DelBuff(2693, 1)--去色
			npc_cang.DelBuff(2692, 1)--去财
			npc_cang.DelBuff(2695, 1)--去权
			npc_cang.AddBuff(0, 99, 2698, 1)--怒火·假尼姑
		end
		local npc_xuan = scene.GetNpcByNickName("chengdulaotou_xuan")
		if npc_xuan then 
			--改变势力
			player.DelBuff(2697, 1)--破绽
			npc_xuan.SetForceID(28)
			npc_xuan.ModifyThreat(player.dwID, 30)
			npc_xuan.SayTo(player.dwID,player.szName .. GetEditorString(1, 5580))
			npc_xuan.DelBuff(2702, 1)--即将识破
			npc_xuan.DelBuff(2703, 1)--去除中计
			npc_xuan.DelBuff(2688, 1)--去酒
			npc_xuan.DelBuff(2694, 1)--去色
			npc_xuan.DelBuff(2691, 1)--去财
			npc_xuan.DelBuff(2696, 1)--去权
			npc_xuan.AddBuff(0, 99, 2698, 1)--怒火·假尼姑
		end
	end
 
   if nLeftFrame > 0 then
   	
   	
   end	
	if nLeftFrame == 0 then
	
		
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com