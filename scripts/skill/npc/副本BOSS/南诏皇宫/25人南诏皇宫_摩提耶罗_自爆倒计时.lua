------------------------------------------------
-- 创建人   :  张豪	
-- 创建时间	:  2012-9-19
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local cNpc = GetNpc(dwCharacterID)
	if not cNpc then
		return
	end
	cNpc.Stand()
	cNpc.CastSkill(4349,2)
	cNpc.SetDisappearFrames(8,0) 
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com