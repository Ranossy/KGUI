------------------------------------------------
-- 文件名    : 荻花圣殿_3号BOSS_红药祭祀_古蝉毒水_施放.lua
-- 创建人    :  zhanghao
-- 创建时间  :  2011-01-23
-- 用途(模块):  副本BOSS
-- 武功门派  :  无
-- 武功类型  :  无
-- 武功套路  :  无
-- 技能名称  :  无
-- 技能效果  :  给BOSS和自己加BUFF
------------------------------------------------

--------------脚本文件开始------------------------------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
			local npc = GetNpc(dwCharacterID)
	if npc then 
		local scene = npc.GetScene()
				if scene then
					npc1 = scene.GetNpcByNickName("MuRongZhuiFeng")
					if npc1 then
						npc.CastSkill(2117,2,TARGET.NPC,npc1.dwID) 
					end
				end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com