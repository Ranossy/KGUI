------------------------------------------------
-- �ļ���    : �ڹ�ϵ_��ͨ_�����ڹ�������
-- ������    : zhangqi
-- ����ʱ��  : 2009-06-08
-- ��;(ģ��): ����
-- ��������  : �⹦ϵ
-- ��������  : 
-- ����Ч��  : 
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/skill/����/VerationTable.lua")

tSkillData =
{
	{nMagicAttackPowerPercent = 10 },		
	{nMagicAttackPowerPercent = 20 },		
	{nMagicAttackPowerPercent = 31 },		
	{nMagicAttackPowerPercent = 41 },		
	{nMagicAttackPowerPercent = 51 },		
	{nMagicAttackPowerPercent = 61 },	
	{nMagicAttackPowerPercent = 71 },	
	{nMagicAttackPowerPercent = 82 },	
	{nMagicAttackPowerPercent = 92 },	
	{nMagicAttackPowerPercent = 102},			
};          
            
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel;
	          
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.MAGIC_ATTACK_POWER_PERCENT,
		tSkillData[dwSkillLevel].nMagicAttackPowerPercent,
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
		 player.AcquireAchievement(125)
	end
	if player.GetSkillLevel(46) > 0 and player.GetSkillLevel(170) > 0 and not player.IsAchievementAcquired(114) then
		player.AcquireAchievement(114)
	end
	player.AddAchievementCount(1156,2)
	
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