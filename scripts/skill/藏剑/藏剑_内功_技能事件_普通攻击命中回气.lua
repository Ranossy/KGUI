------------------------------------------------
-- �ļ���    :  �ؽ�_�ڹ�_�����¼�_��ͨ�������л���.lua
-- ������    :  zhangqi	
-- ����ʱ��  :  2010-01-27
-- ��;(ģ��):  �书����
-- �书����  :  �ؽ�
-- �书����  :  �⹦
-- �书��·  :  ��ˮ����
-- ��������  :  ��Ϫ����
-- ����Ч��  :  Ϫˮ�������̣������ھ�Ϫʮ�˽�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 10, nCostRage = 0 ,nDamage = 14*0.95, nDamageRand = 14*0.1},   	-- Level 1 Dash�ٶȵ�λ ��/֡
	{nAddRage = 10, nCostRage = 0 ,nDamage = 23*0.95, nDamageRand = 23*0.1},   	-- Level 2 Dash�ٶȵ�λ ��/֡
	{nAddRage = 10, nCostRage = 0 ,nDamage = 31*0.95, nDamageRand = 31*0.1},   	-- Level 3 Dash�ٶȵ�λ ��/֡
	{nAddRage = 10, nCostRage = 0 ,nDamage = 39*0.95, nDamageRand = 39*0.1},   	-- Level 4 Dash�ٶȵ�λ ��/֡
	{nAddRage = 10, nCostRage = 0 ,nDamage = 47*0.95, nDamageRand = 47*0.1},   	-- Level 5 Dash�ٶȵ�λ ��/֡
	{nAddRage = 10, nCostRage = 0 ,nDamage = 54*0.95, nDamageRand = 54*0.1},   	-- Level 6 Dash�ٶȵ�λ ��/֡
	{nAddRage = 10, nCostRage = 0 ,nDamage = 62*0.95, nDamageRand = 62*0.1},   	-- Level 7 Dash�ٶȵ�λ ��/֡
	{nAddRage = 10, nCostRage = 0 ,nDamage = 70*0.95, nDamageRand = 70*0.1},   	-- Level 8 Dash�ٶȵ�λ ��/֡
	{nAddRage = 10, nCostRage = 0 ,nDamage = 78*0.95, nDamageRand = 78*0.1},   	-- Level 9 Dash�ٶȵ�λ ��/֡
	{nAddRage = 10, nCostRage = 0 ,nDamage = 86*0.95, nDamageRand = 86*0.1}   	-- Level 10 Dash�ٶȵ�λ ��/֡
	
};           
             

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CURRENT_RAGE,
		5,
		0
	);

    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		
	--skill.SetNormalCoolDown(1, 333);

	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
   --	skill.nChannelInterval	= 16;
	skill.nMinRadius	= 0* LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius        = 4 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange       = 256; 										--ʩ�ŽǶ�,ȫ��256
	skill.nAreaRadius		= 8 * LENGTH_BASE;	
    skill.nWeaponDamagePercent	= 0;
	skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate        = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
	return true;
end


--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)

end

--function Apply(dwCharacterID)
--	local player = GetPlayer(dwCharacterID)
--	
--
--	player.DelMultiGroupBuffByFunctionType(4);
--	player.DelMultiGroupBuffByFunctionType(6);
--	player.DelMultiGroupBuffByFunctionType(8);
--	player.DelMultiGroupBuffByFunctionType(7);
--	
--end
--
--function UnApply(dwCharacterID)
--end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com