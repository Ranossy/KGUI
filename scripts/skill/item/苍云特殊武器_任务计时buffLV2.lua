---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/item/苍云特殊武器_任务计时buffLV2.lua
-- 更新时间:	2016/3/28 11:35:07
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local npc = GetNpc(nCharacterID)
	if not npc then
		return
	end

	local scene = npc.GetScene()
	local xiaoseng = scene.GetNpcByNickName("xiaoseng")
	if xiaoseng and xiaoseng.GetCustomBoolean(17) == false then
		npc.SetCustomBoolean(3, true)
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com