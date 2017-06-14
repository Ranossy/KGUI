---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/上阳宫_观风殿/入口_小怪_锁足结束取消动作.lua
-- 更新时间:	2016/8/23 19:43:02
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local npc = GetNpc(dwCharacterID)
	if npc then
		local scene = npc.GetScene()
		npc.DoAction(0, 10056)
		if scene.dwMapID == 240 then
			npc.AddBuff(npc.dwID, npc.nLevel, 11126, 1, 2)
		else
			npc.AddBuff(npc.dwID, npc.nLevel, 11126, 2, 2)
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end


 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com