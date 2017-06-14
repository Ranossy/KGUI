------------------------------------------------
-- �ļ���    :  �ؽ�_��彣ʽ_�Ӽ���_ϼ����ʯԶ����.lua
-- ������    :  zhangqi	
-- ����ʱ��  :  2010-01-28
-- ��;(ģ��):  �书����
-- �书����  :  �ؽ�
-- �书����  :  �⹦
-- �书��·  :  
-- ��������  :  
-- ����Ч��  :  
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 15 ,nDamage = 28 *0.95, nDamageRand = 28 *0.1},   	-- Level 1 
	{nAddRage = 0, nCostRage = 15 ,nDamage = 52 *0.95, nDamageRand = 52 *0.1},   	-- Level 2 
	{nAddRage = 0, nCostRage = 15 ,nDamage = 73 *0.95, nDamageRand = 73 *0.1},   	-- Level 3 
	{nAddRage = 0, nCostRage = 15 ,nDamage = 94 *0.95, nDamageRand = 94 *0.1},   	-- Level 4 
	{nAddRage = 0, nCostRage = 15 ,nDamage = 115*0.95, nDamageRand = 115*0.1},   	-- Level 5 
	{nAddRage = 0, nCostRage = 15 ,nDamage = 136*0.95, nDamageRand = 136*0.1},   	-- Level 6 
	{nAddRage = 0, nCostRage = 15 ,nDamage = 157*0.95, nDamageRand = 157*0.1},   	-- Level 7 
	{nAddRage = 0, nCostRage = 20 ,nDamage = 185*0.95, nDamageRand = 185*0.1}   	-- Level 8
};           
             

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;
	for i = 1, 2 do
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
			ATTRIBUTE_TYPE.DETACH_SINGLE_BUFF,
			7, 
			10000
		);
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,		-- ��������ģʽ
			ATTRIBUTE_TYPE.DETACH_SINGLE_BUFF,			-- ħ������
			3,												--����ֵ1
			10000											--����ֵ2
		);
		   	
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,		-- ��������ģʽ
			ATTRIBUTE_TYPE.DETACH_SINGLE_BUFF,			-- ħ������
			5,												--����ֵ1
			10000												--����ֵ2
		);
	
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,		-- ��������ģʽ
			ATTRIBUTE_TYPE.DETACH_SINGLE_BUFF,			-- ħ������
			11,												--����ֵ1
			10000												--����ֵ2
		);
	end
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		

	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostRage	= tSkillData[dwSkillLevel].nCostRage;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
   	skill.nChannelInterval	= 32;
	skill.nAreaRadius		= 6 * LENGTH_BASE;		-- �������ð뾶 
	skill.nMinRadius	= 0* LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius        = 6 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange       = 256; 										--ʩ�ŽǶ�,ȫ��256
    skill.nWeaponDamagePercent	= 1024;
	skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
	skill.nTargetCountLimit	= 10;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
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