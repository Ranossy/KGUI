------------------------------------------------
-- �ļ���    : �ڹ�ϵ_��ͨ_�����ڹ����ļ���
-- ������    : zhangqi
-- ����ʱ��  : 2009-06-08
-- ��;(ģ��): ����
-- ��������  : 
-- ��������  : 
-- ����Ч��  : 
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/skill/����/VerationTable.lua")


tSkillData =
{
	{nRate = 50  },		
	{nRate = 100 },		
	{nRate = 150 },		
	{nRate = 200 },		
	{nRate = 250 },		
	{nRate = 300 },		
	{nRate = 350 },		
	{nRate = 400 },		
	{nRate = 450 },		
	{nRate = 500 },				
};          
            
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel;
	          
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SOLAR_CRITICAL_STRIKE_BASE_RATE,
		tSkillData[dwSkillLevel].nRate,
		0       
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.NEUTRAL_CRITICAL_STRIKE_BASE_RATE,
		tSkillData[dwSkillLevel].nRate,
		0       
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.LUNAR_CRITICAL_STRIKE_BASE_RATE,
		tSkillData[dwSkillLevel].nRate,
		0       
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.POISON_CRITICAL_STRIKE_BASE_RATE,
		tSkillData[dwSkillLevel].nRate,
		0       
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.MAGIC_CRITICAL_DAMAGE_POWER_BASE_KILONUM_RATE,
		tSkillData[dwSkillLevel].nRate/5,
		0       
	);	
    return true;
end


--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == 10 then
		 player.AcquireAchievement(120)
	end
	if player.GetSkillLevel(46) > 0 and player.GetSkillLevel(170) > 0 and not player.IsAchievementAcquired(114) then
		player.AcquireAchievement(114)
	end
	player.AddAchievementCount(1151,2)

	local nAchi = 0
	for i = 1,10 do
		if player.GetSkillLevel(tVenationEffectID[i]) == 10 then
			nAchi = nAchi +1
		end
	end
	if nAchi >= 10 and not player.IsAchievementAcquired(127) then
		player.AcquireAchievement(127)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com