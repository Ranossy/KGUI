------------------------------------------------
-- 创建人   :  张豪	
-- 创建时间	:  2012-8-28
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local cPlayer = GetPlayer(dwCharacterID)
	if not cPlayer then
		return
	end
	local scene = cPlayer.GetScene()
	if not scene then
	return	
	end
	local cNpc = scene.GetNpcByNickName("mylj_zongkong")
	if not cNpc then 
		return
	end
	cNpc.FireAIEvent(2002, 0, dwCharacterID)
	cNpc.CastSkill(4466,1)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com