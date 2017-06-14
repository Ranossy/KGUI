
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel
	skill.nMinRadius		= 0;										--技能施放最小半径
	skill.nMaxRadius        = 25 * LENGTH_BASE;						--技能施放最大半径
	skill.nAngleRange       = 256; 									--施放角度
	--skill.nAreaRadius       = 25 * LENGTH_BASE;
	skill.nPrepareFrames    = 160;										--吟唱帧数,16帧等于1秒 
	--skill.nBulletVelocity   = 0;										--子弹速度,点/帧
	--skill.nBreakRate        = 0;									--被打断的概率,默认1024表示一定被打断
	return true;
end



--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
end

function OnSkillLevelUp(skill, player)

end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com