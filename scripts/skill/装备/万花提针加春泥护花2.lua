------------------------------------------------
-- 创建人   :  zhengkaifeng
-- 创建时间	:  2009-09-22
-- 效果备注	:  万花提针加两层春泥护花
------------------------------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local nBuffLevel = player.GetSkillLevel(132)
	player.AddBuff(0,99,122,nBuffLevel,0)
	player.AddBuff(0,99,122,nBuffLevel,0)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com