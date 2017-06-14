---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_�����﷨_�γ۳�.lua
-- ����ʱ��:	2013/6/6 20:46:19
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ���_�����﷨_�γ۳�.lua
-- ������    :  ����	
-- ����ʱ��  :  2008-04-07
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  �����﷨	
-- ��������  :  �γ۳�
-- ����Ч��  :  ս��������,�ܱ����,�ܱ�������
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_MULTI_GROUP_BUFF_BY_FUNCTIONTYPE,
		7,
		9999
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		244,
		1
	);
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
	--ATTRIBUTE_TYPE.CALL_BUFF,
	--2756,
	--2
	--);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/���/���_�����﷨_�γ۳�.lua",
		0
	);
	--skill.BindBuff(1, 1018, 1);	
	skill.AddSlowCheckSelfBuff(2587, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ����Ŀ��Buff
	skill.AddSlowCheckSelfBuff(3767, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL); --����������
	skill.AddSlowCheckSelfBuff(7682, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- �ݵ�ó�������У�Ĭ�Ͻ�ֹ���
	skill.AddSlowCheckSelfBuff(9469, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��ɮ��ĳｨ��������Ĭ�Ͻ�ֹ���
	skill.AddSlowCheckSelfBuff(9470, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��ɮ��ĳｨ��������Ĭ�Ͻ�ֹ���
	skill.AddSlowCheckSelfBuff(9471, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��ɮ��ĳｨ��������Ĭ�Ͻ�ֹ���
	skill.AddSlowCheckSelfBuff(9520, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��ɮ��ĳｨ��������Ĭ�Ͻ�ֹ���
	skill.AddSlowCheckSelfBuff(9521, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��ɮ��ĳｨ��������Ĭ�Ͻ�ֹ���
	skill.AddSlowCheckSelfBuff(9522, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��ɮ��ĳｨ��������Ĭ�Ͻ�ֹ���
--	skill.AddSlowCheckSelfBuff(10802, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ˫����ǧ���BUFF��Ĭ�Ͻ�ֹ���
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);		--����CD1��
	skill.SetNormalCoolDown(1, 108);		--����CD1��
	skill.SetCheckCoolDown(1, 444)
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= 11;
	skill.nCostManaBasePercent = 12;	-- �������ĵ�����
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0;										--����ʩ����С�뾶
	skill.nMaxRadius = 25 * LENGTH_BASE;						--����ʩ�����뾶
	skill.nAngleRange = 256; 									--ʩ�ŽǶ�
	skill.nAreaRadius = 25 * LENGTH_BASE;
	skill.nPrepareFrames = 24;										--����֡��,16֡����1��
	skill.nMinPrepareFrames = 1;
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
    
	return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	local item = player.GetEquippedHorse()
	local nRideSkillLevel = player.GetSkillLevel(605)

	
	
	if item and nRideSkillLevel > 0 and item.dwIndex ~= 566 and item.dwIndex ~= 567 and item.dwIndex ~= 11105 and item.dwIndex ~= 11106 and item.dwIndex ~= 11649
		and item.dwIndex ~= 11770 and item.dwIndex ~= 11803 and item.dwIndex ~= 13704 and item.dwIndex ~= 13705 and item.dwIndex ~= 13788 and item.dwIndex ~= 13789
		and item.dwIndex ~= 13790 and item.dwIndex ~= 16894  and item.dwIndex ~= 18305 and item.dwIndex ~= 20176 and item.dwIndex ~= 20265 and item.dwIndex ~= 20986 and item.dwIndex ~= 21076 and item.dwIndex ~= 21077
		and item.dwIndex ~= 21102 then
		return nPreResult;
	else
		return false;
	end
end

function OnSkillLevelUp(skill, player)
end
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	--[[
	print(123)
	print(player.bOnTowerFlag)
	--�Ƕ�����ֹ
	if player.bOnTowerFlag then
		return
	end
	print(456)
	--]]
	
	--[[
	if player.GetSkillLevel(6513) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 2756, 2, 1)
	end
	--]]

	player.AddBuff(dwCharacterID, player.nLevel, 2756, 2, 1)
	
	if player.GetSkillLevel(6780) == 1 then
		--for i = 1, 5 do
		player.AddBuff(dwCharacterID, player.nLevel, 6331, 1, 1)
		player.AddBuff(dwCharacterID, player.nLevel, 6333, 1, 1)
		--end
	end

	--���5��۳ҹ���buff
	for i = 1, 5 do
		player.AddBuff(dwCharacterID, player.nLevel, 6121, 1, 1)
	end

	--��ƥ���ԡ���ش���
	player.AddBuff(dwCharacterID, player.nLevel, 8475, 1)

	ModityCDToUI(player, 433, 0, 0)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com