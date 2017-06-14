---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/上阳宫_观风殿/曹炎烈_箭气AOE.lua
-- 更新时间:	2016/3/22 19:28:15
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------

function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	local scene = npc.GetScene()
	if scene.dwMapID == 240 then
		npc.CastSkill(15550, 1)
	end

	if scene.dwMapID == 248 or scene.dwMapID == 250 then
		npc.CastSkill(15550, 2)
	end
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com