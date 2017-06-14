---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/血战天策/血战天策_山狼_箭气AOE.lua
-- 更新时间:	2013/9/24 15:31:26
-- 更新用户:	ks13376-PC
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	local scene = npc.GetScene()
	if scene.dwMapID == 175 then
		npc.CastSkill(8208, 1)
	end
	
	if scene.dwMapID == 176 then
		npc.CastSkill(8208, 2)
	end
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com