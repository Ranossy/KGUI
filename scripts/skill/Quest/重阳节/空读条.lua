---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/������/�ն���.lua
-- ����ʱ��:	2014/9/21 19:27:21
-- �����û�:	renjei1
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 23989 * 0.8, nDamageRand = 23989 * 0.4, nCostMana = 0}, --level 1
	{nDamageBase = 23989 * 0.8, nDamageRand = 23989 * 0.4, nCostMana = 0}, --level 2
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 3
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 4
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 5
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 6
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 7
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 8
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 9
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	----------------- ħ������ -------------------------------------------------

	----------------- ʩ�ž��� -------------------------------------------------

	----------------- ʱ����� -------------------------------------------------
	skill.nPrepareFrames = 24 ;				-- ����֡��
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ��
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡��w
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
	----------------- ���˴��������� -------------------------------------------------
	skill.nBeatBackRate = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	skill.nBrokenRate = 0 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0

	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com