---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雪稻香村/风雪稻香村_小怪关卡_标记.lua
-- 更新时间:	2014/3/26 11:25:46
-- 更新用户:	wangpengfei1
-- 脚本说明:
----------------------------------------------------------------------<

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local playerthis = GetPlayer(nCharacterID)
	if not playerthis then
		return
	end
	if playerthis.GetDynamicSkillGroup() ~= 0 then
		playerthis.SetDynamicSkillGroup(0)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com