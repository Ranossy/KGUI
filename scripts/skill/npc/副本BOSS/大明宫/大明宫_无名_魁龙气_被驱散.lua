------------------------------------------------
-- 创建人   :  张豪	
-- 创建时间	:  2013-4-23
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	if nLeftFrame > 0 then
		if scene.dwMapID == 164 then
			player.CastSkill(6118, 1)
		else
			player.CastSkill(6118, 2)
		end	
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com