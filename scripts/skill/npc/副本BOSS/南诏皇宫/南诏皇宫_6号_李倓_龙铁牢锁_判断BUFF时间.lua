------------------------------------------------
-- 创建人   :  张豪	
-- 创建时间	:  2013-1-6
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
    local npc1 = GetNpc(nCharacterID)
    if not npc1 then
    	return
    end
    local scene = npc1.GetScene()
    if not scene then
    	return
    end

	if nLeftFrame < 2721 then
		local npc = scene.GetNpcByNickName("LiTanzongkong")
		if npc then
			npc.SetCustomBoolean(8, true)
		end
	end
	local boss = scene.GetNpcByNickName("LiTanBoss")
	if not boss then
		return
	end
	boss.FireAIEvent(2003, 0, 0)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com