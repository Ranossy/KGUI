------------------------------------------------
-- 文件名    : 荻花圣殿_4号BOSS_卫戚梧_气势八刀.lua
-- 创建人    :  zhanghao
-- 创建时间  :  2010-11-8
-- 用途(模块):  副本BOSS
-- 武功门派  :  无
-- 武功类型  :  无
-- 武功套路  :  无
-- 技能名称  :  无
-- 技能效果  :  向全场景玩家添加BUFF
------------------------------------------------

--------------脚本文件开始------------------------------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	if IsPlayer(dwCharacterID) then
		local Buff_ID = 2188
		local Buff_LV = 4
		local cPlayer = GetPlayer(dwCharacterID)
		if cPlayer then
			local scene = cPlayer.GetScene()
			local nPlayer = {}
			local tPlayer = scene.GetAllPlayer()
			if tPlayer then
				for i = 1, #tPlayer do
					local cPlayer = GetPlayer(tPlayer[i])
					if cPlayer and cPlayer.nMoveState ~= MOVE_STATE.ON_DEATH then
						cPlayer.AddBuff(0, 99, Buff_ID, Buff_LV)
					end
				end
			end
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com