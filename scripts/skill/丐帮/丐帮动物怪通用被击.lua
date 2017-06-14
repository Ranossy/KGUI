---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/丐帮/丐帮动物怪通用被击.lua
-- 更新时间:	2013/9/27 11:46:22
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if npc then
		if npc.nImmuneSkillMoveCount == 0 then
			npc.BeHitted(0, 1, 1, 28)
		end	
	end
	if not npc then
		return
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com