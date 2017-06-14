---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/江湖/骑乘_狼车空格_副驾.lua
-- 更新时间:	2017/6/1 22:39:14
-- 更新用户:	ZHANGYAN0-PC
-- 脚本说明:
----------------------------------------------------------------------<
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/江湖/骑乘_狼车空格_副驾.lua",
		0
	);

	-- skill.nCostMana			= 0;
	--skill.SetCheckCoolDown(1, 444)
	--------------- 设置杂项参数 ----------------------------------------------------------------------

	-- skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	-- skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0;										--技能施放最小半径
	skill.nMaxRadius = 25 * LENGTH_BASE;						--技能施放最大半径
	skill.nAngleRange = 256; 									--施放角度
	skill.nAreaRadius = 25 * LENGTH_BASE;
	--skill.nPrepareFrames = 48;										--吟唱帧数,16帧等于1秒

	skill.nBulletVelocity = 0;										--子弹速度,点/帧

	skill.nBreakRate = 0;									--被打断的概率,默认1024表示一定被打断

	return true;
end

function CanCast(player, nPreResult)
	local item = player.GetEquippedHorse()
	if not item then
		return false;
	end
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
end

function Apply(dwCharacterID)

	--player.Talk(99999)
	--[[
	if nItem.dwIndex == 16894  then--牦牛
		local buff = cPlayer.GetBuff(10532, 1)
		if not buff then
			cPlayer.AddBuff(0, 99, 10532, 1, 5)--5秒
		end
	end
	--]]
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com